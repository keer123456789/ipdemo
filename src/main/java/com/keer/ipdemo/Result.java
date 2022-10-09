package com.keer.ipdemo;

public class Result<T> {
    private String msg;
    private int code;
    private T data;

    public Result(String msg, int code, T data) {
        this.msg = msg;
        this.code = code;
        this.data = data;
    }

    public Result() {
    }

    public static <T> Result<T> ok(T data) {
        return new Result("success", 200, data);
    }

    public static <T> Result<T> error() {
        return new Result("fail", 500, null);
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
