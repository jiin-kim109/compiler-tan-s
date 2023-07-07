package semanticAnalyzer.signatures;

import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class PromotedSignature {
    FunctionSignature signature;
    List<Promotion> promotions;
    List<Type> concreteParamTypes;
    List<Type> concreteResultType;

    public PromotedSignature(FunctionSignature signature, List<Promotion> promotions) {
        this.signature = signature;
        this.promotions = extendPromotionListSize(promotions, signature.numTypes());
    }

    public boolean accepts(List<Type> childTypes) {
        List<Type> promotedTypes = new ArrayList<>(childTypes);
        for (int i=0; i<childTypes.size(); i++){
            if (promotions.size() > i)
                promotedTypes.set(i, promotions.get(i).apply(childTypes.get(i)));
        }
        return signature.accepts(promotedTypes);
    }

    private List<Promotion> extendPromotionListSize(List<Promotion> p, int size) {
        assert p.size() <= size;
        List<Promotion> promotions = new ArrayList<Promotion>(p);
        for (int i=0; i<size-p.size(); i++) {
            promotions.add(Promotion.NONE);
        }
        return promotions;
    }

    public Type resultType() {
        return promotions.get(promotions.size()-1).apply(signature.resultType().concreteType());
    }
    public List<Type> paramTypes() {
        List<Type> promotedTypes = IntStream.range(0, paramTypes().size())
                        .mapToObj(i -> promotions.get(i).apply(paramTypes().get(i).concreteType()))
                        .collect(Collectors.toList());
        return promotedTypes;
    }
    public Object getVariant() {
        return signature.getVariant();
    }
    public int numPromotions() {
        return promotions.stream().filter(promotion -> !promotion.isNull()).toList().size();
    }
    public Promotion promotion(int i) {
        return promotions.get(i);
    }

    public static PromotedSignature nullInstance() {
        return new PromotedSignature(FunctionSignature.nullInstance(), new ArrayList<>());
    }

    public static List<PromotedSignature> promotedSignatures(FunctionSignatures signatures, List<Type> types) {
        List<PromotedSignature> result = new ArrayList<PromotedSignature>();
        for (FunctionSignature signature: signatures) {
            result.addAll(findAll(signature, types));
        }
        return result;
    }

    private static List<PromotedSignature> findAll(FunctionSignature signature, List<Type> types) {
        List<PromotedSignature> promotedSignatures = new ArrayList<>();
        List<Promotion> promotions = new ArrayList<Promotion>();
        List<Type> promotedTypes = new ArrayList<>();
        for (int i=0; i<types.size(); i++) {
            promotions.add(Promotion.NONE);
            promotedTypes.add(PrimitiveType.NO_TYPE);
        }
        findAllRecursive(signature, types, promotions, promotedTypes, promotedSignatures,0);
        return promotedSignatures;
    }

    private static void findAllRecursive(FunctionSignature signature, List<Type> types, List<Promotion> promotions, List<Type> promotedTypes, List<PromotedSignature> promotedSignatures, int index) {
        List<Promotion> promo = new ArrayList<Promotion>(promotions);
        List<Type> promoTypes = new ArrayList<>(promotedTypes);
        if (index >= types.size()) {
            if (signature.accepts(promoTypes)) {
                promotedSignatures.add(new PromotedSignature(signature, promo));
            }
            return;
        }
        Type type = types.get(index);
        for (Promotion promotion : Promotion.values()) {
            if (promotion.appliesTo(type)) {
                promoTypes.set(index, promotion.apply(type));
                promo.set(index, promotion);
                findAllRecursive(signature, types, promo, promoTypes, promotedSignatures, index+1);
            }
        }
    }
}
