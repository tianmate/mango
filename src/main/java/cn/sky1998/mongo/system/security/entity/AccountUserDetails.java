package cn.sky1998.mongo.system.security.entity;

import cn.sky1998.mongo.system.domain.AccountRoleVo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author tcy@1753163342@qq.com
 * @Date 08-12-2021
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class AccountUserDetails implements UserDetails , Serializable{

    private static final long serialVersionUID = 3245578690496182643L;

    private Long id;
    private String username;
    private String password;

    @JsonIgnore
    private Collection<? extends GrantedAuthority> authorities;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    private List<AccountRoleVo> sysRoles;

    public List<AccountRoleVo> getSysRoles() {
        return sysRoles;
    }

    public void setSysRoles(List<AccountRoleVo> sysRoles) {
        this.sysRoles = sysRoles;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }




    public AccountUserDetails() {
    }

    @Override
    @JsonIgnore
    public Collection<? extends GrantedAuthority> getAuthorities() {
         List<SimpleGrantedAuthority> authoritiesinner = new ArrayList<>();
        for (AccountRoleVo role : sysRoles) {
            authoritiesinner.add(new SimpleGrantedAuthority(role.getRole().getName()));
        }
        return authoritiesinner;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }


    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    /**
     * 密码是否被锁定
     * @return
     */
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    @JsonIgnore
    public boolean isEnabled() {
        return true;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public AccountUserDetails(Long id, String username, String password, List<AccountRoleVo> sysRoles) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.sysRoles = sysRoles;
    }

}