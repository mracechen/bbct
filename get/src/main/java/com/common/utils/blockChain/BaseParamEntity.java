package com.common.utils.blockChain;

import com.common.utils.IDUtils;
import lombok.Data;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author 陈杰
 * 请求参数通用实体类
 * */
@Data
public class BaseParamEntity {

    /** 撮合程序方法名 */
    private String method;

    private Collection params;

    private Integer id = IDUtils.randomInt();

    public BaseParamEntity(){}

    public BaseParamEntity(String method, Object params){
        try {
            Field[] declaredFields = params.getClass().getDeclaredFields();
            List<Object> list = new ArrayList<>();
            for(int i=0;i<declaredFields.length;i++){
                Object o = declaredFields[i].get(params);
                if(o != null){
                    list.add(o);
                }
            }
            this.params = list;
        }catch (Exception e){
            e.printStackTrace();
        }
        this.method = method;
    }
}