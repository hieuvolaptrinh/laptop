package start.spring.io.spring1.service.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Constraint(validatedBy = StrongPasswordValidator.class) // nói với java biết đây là annotation để validate data (
                                                         // StrongPasswordValidator.class )
@Target({ ElementType.METHOD, ElementType.FIELD }) // phạm vi áp dụng cho method và field
@Retention(RetentionPolicy.RUNTIME) // thời gian chạy của annotation
@Documented
public @interface StrongPassword {
    // cái này là mình tự định nghĩa để validate data, không phải của java
    // không cần dùng các annotation của java ở trong domain
    String message() default "Must be 8 characters long and combination of uppercase letters, lowercase letters, numbers, special characters.";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
