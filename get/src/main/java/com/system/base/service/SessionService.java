package com.system.base.service;

import com.system.base.domain.UserDO;
import com.system.base.domain.UserOnline;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@Service
public interface SessionService {
    List<UserOnline> list();

    List<UserDO> listOnlineUser();

    Collection<Session> sessionList();

    boolean forceLogout(String sessionId);
}
