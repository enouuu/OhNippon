package Exceptions;
public class NullValueException extends Exception {

    public NullValueException() {
        super();
    }

    public NullValueException(String errorMessage) {
        super(errorMessage);
    }
}
