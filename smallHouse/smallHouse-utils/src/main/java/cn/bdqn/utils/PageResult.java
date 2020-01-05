package cn.bdqn.utils;

public class PageResult<T> {
    private String msg;
    //返回的数据
    private  T data;
    private  Integer code;
    //总记录数
    private  Integer count;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public PageResult() {
    }

    public PageResult(String msg, T data, Integer code, Integer count) {
        this.msg = msg;
        this.data = data;
        this.code = code;
        this.count = count;
    }

    @Override
    public String toString() {
        return "PageResult{" +
                "msg='" + msg + '\'' +
                ", data=" + data +
                ", code=" + code +
                ", count=" + count +
                '}';
    }
}
