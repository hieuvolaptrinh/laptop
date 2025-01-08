package start.spring.io.spring1.domain;

import java.util.List;

import org.hibernate.mapping.Array;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "roles")
public class Role {
    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private long roleId;
    private String roleName;
    private String description;

    // role -> many user
    @OneToMany(mappedBy = "role") // mappedBy là tên biến Role trong class User
    private List<User> users;

    public long getRoleId() {
        return roleId;
    }

    public void setRoleId(long roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Role [roleId=" + roleId + ", roleName=" + roleName + ", description=" + description + "]";
    }

}
