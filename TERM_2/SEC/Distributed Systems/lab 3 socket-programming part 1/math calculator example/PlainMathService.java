public class PlainMathService implements MathService {
    public double add(double firstValue, double secondValue) {
        return firstValue + secondValue;
    }

    public double sub(double firstValue, double secondValue) {
        return firstValue - secondValue;
    }

    public double mul(double firstValue, double secondValue) {
        return firstValue * secondValue;
    }

    public double div(double firstValue, double secondValue) {
        if (secondValue != 0)
            return firstValue / secondValue;
        return Double.MAX_VALUE;
    }
}
