
public class Data<T>
{
    public int Id { get; set; }
    public string? Name { get; set; } = "";
    public int? MaxPressure { get; set; }
    public int? LiquidTemp { get; set; }
    public double? Weight { get; set; }
    public T? Motor { get; set; }
    public T? Housing { get; set; } 
    public T? Impeller { get; set; } 
    public string? Description { get; set; } = "";
    public string? Picture { get; set; } = "";
    public int? Price { get; set; }
}
