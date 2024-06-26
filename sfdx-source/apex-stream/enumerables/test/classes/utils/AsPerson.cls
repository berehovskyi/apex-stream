/**
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ExcessiveParameterList')
public class AsPerson implements Comparable {
    private String name;
    private final Integer age;
    private final Date someDate;
    private Long autoId;
    private Boolean isActive;
    private Double probability;
    public AsPerson(String name, Integer age, Date someDate, Long longNumber, Boolean isActive) {
        this.name = name;
        this.age = age;
        this.someDate = someDate;
        this.autoId = longNumber;
        this.isActive = isActive;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Integer getAge() {
        return age;
    }
    public Long getAutoId() {
        return autoId;
    }
    public void setAutoId(Long autoId) {
        this.autoId = autoId;
    }
    public Boolean isActive() {
        return isActive;
    }
    public void setActive(Boolean isActive) {
        this.isActive = isActive;
    }
    public Double getProbability() {
        return probability;
    }
    public void setProbability(Double probability) {
        this.probability = probability;
    }
    public Integer compareTo(Object o) {
        AsPerson that = (AsPerson) o;
        if (autoId == that.autoId) return 0;
        if (autoId > that.autoId) return 1;
        return -1;
    }
    public Boolean equals(Object obj) {
        if (obj == null || !(obj instanceof AsPerson)) return false;
        AsPerson that = (AsPerson) obj;
        return this.name == that.name
            && (this.age == that.age)
            && (this.someDate == that.someDate)
            && (this.autoId == that.autoId);
    }
    public override Integer hashCode() {
        Integer result = 0;
        result = 31 * result + (name == null ? 0 : name.hashCode());
        result = 31 * result + (age == null ? 0 : age);
        result = 31 * result + (autoId == null ? 0 : (Integer) (autoId ^ (autoId >>> 32)));
        return result;
    }
}
