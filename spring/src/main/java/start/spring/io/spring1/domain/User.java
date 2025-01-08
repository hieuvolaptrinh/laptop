package start.spring.io.spring1.domain;

import org.hibernate.annotations.ManyToAny;

import java.util.List;

import jakarta.annotation.Generated;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import start.spring.io.spring1.service.validator.StrongPassword;

@Entity // biến class thành table trong database
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private long id;

    @NotNull(message = "Email không được để trống")
    @Email(regexp = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$", message = "Email không đúng định dạng")
    private String email;

    @NotNull(message = "Password không được để trống")
    @StrongPassword(message = "Password phải chứa ít nhất 1 chữ số, 1 chữ cái viết thường, 1 chữ cái viết hoa, 1 ký tự đặc biệt và dài hơn 8 ký tự")
    private String password; // StrongPassword là cái anotion mình tự định nghĩa

    @Size(min = 2, message = "Fullname phải từ 2 kí tự trở lên")
    private String fullName;
    private String address;
    private String phone;
    private String avatar;
    // roleId;
    // User many -> to one Role
    @ManyToOne
    @JoinColumn(name = "roleId")  // Tên cột trong bảng user liên kết tới bảng role
    private Role role;

    // User -> many order
    @OneToMany(mappedBy = "user")
    private List<Order> order;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", email=" + email + ", password=" + password + ", fullName=" + fullName
                + ", address=" + address + ", phone=" + phone + ", avatar=" + avatar + "]";
    }

}
