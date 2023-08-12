import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/talentplus")
public class MyController {
    @GetMapping("/getname")
    public String returnWord() {
        return "Talent Plus";
    }
}


