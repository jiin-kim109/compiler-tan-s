package semanticAnalyzer.signatures;

import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import java.util.ArrayList;
import java.util.List;

public class PromotedSignature {
    FunctionSignature signature;
    List<Promotion> promotions;
    List<Type> typeVariableSettings;

    public PromotedSignature(FunctionSignature signature, List<Promotion> promotions) {
        this.signature = signature;
        this.promotions = new ArrayList<Promotion>(promotions);
        this.typeVariableSettings = signature.typeVariableSettings();
    }

    public int numPromotions() {
        return promotions.stream().filter(promotion -> !promotion.isNull()).toList().size();
    }

    public Type resultType() {
        setTypeVariables();
        return signature.resultType().concreteType();
    }

    private void setTypeVariables() {
        signature.setTypeVariables(typeVariableSettings);
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

    public boolean accepts(List<Type> childTypes) {
        List<Type> promotedTypes = new ArrayList<>(childTypes);
        for (int i=0; i<childTypes.size(); i++){
            if (promotions.size() > i)
                promotedTypes.set(i, promotions.get(i).apply(childTypes.get(i)));
        }
        return signature.accepts(promotedTypes);
    }

    public Object getVariant() {
        return signature.getVariant();
    }

    public Promotion promotion(int i) {
        return promotions.get(i);
    }
}
