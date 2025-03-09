package start.spring.io.spring1.domain.DTO;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import start.spring.io.spring1.service.validator.RegisterChecked;

@RegisterChecked
public class RegisterDTO {
    // nó là pattern để lưu trữ thông tin đăng ký
    // không phải là entity để lưu trữ thông tin đăng ký
    // để lưu trữ thông tin đăng ký
    @Size(min = 3, message = "Tên phải có ít nhất 3 ký tự.............")
    @NotNull(message = "Tên không được để trống")
    private String firstName;
    private String lastName;

    @NotNull(message = "Email không được để trống")
    @Email(regexp = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$", message = "Email không đúng định dạng")
    private String email;

    @Size(min = 6, message = "Mật khẩu phải có ít nhất 6 ký tự")
    private String password;
    private String confirmPassword;

    public RegisterDTO() {
    }

    public RegisterDTO(String firstName, String lastName, String email, String password, String confirmPassword) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.confirmPassword = confirmPassword;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}
