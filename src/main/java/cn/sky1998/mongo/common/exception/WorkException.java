package cn.sky1998.mongo.common.exception;

public class WorkException extends RuntimeException{
    private static final long serialVersionUID = 1L;

    private Integer code;

    private String message;

    public WorkException(Integer code) {
        this.code = code;
    }

    public WorkException(String message) {
        this.message = message;
    }

    public WorkException(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
