package com.get.dao;

import com.get.domain.SwFiatCoinDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-07-03 16:54:01
 */
@Mapper
public interface SwFiatCoinDao {

    SwFiatCoinDO get(Integer id);

    List<SwFiatCoinDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(SwFiatCoinDO swFiatCoin);

    int update(SwFiatCoinDO swFiatCoin);

    int remove(Integer id);

    int batchRemove(Integer[] ids);

    List<SwFiatCoinDO> selectByCoinId(@Param("coin_id") String coin_id, @Param("isShow") Byte isShow);

    /** 这个是查询所有是否显示为 2的国家 */
    List<SwFiatCoinDO> selectAll();

    List<SwFiatCoinDO> selectByShow(@Param("isShow") Byte isShow);
}
