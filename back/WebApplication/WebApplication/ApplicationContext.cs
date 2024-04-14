using Microsoft.EntityFrameworkCore;

public class ApplicationContext : DbContext
{
    public DbSet<Data<string>> Pumps { get; set; } = null!;
    public DbSet<Data<int>> Pump { get; set; } = null!;

    public DbSet<SelectData> Dict { get; set; } = null!;
    public ApplicationContext(DbContextOptions<ApplicationContext> options)
        : base(options)
    {
        Database.EnsureCreated();
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Data<string>>().HasNoKey();
    }

    public IQueryable<Data<string>> GetPumps()
    {
        return Pumps.FromSqlRaw("select p.id , p.\"name\" , p.maxpressure , p.liquidtemp , p.weight ,\r\nm.name as \"Motor\", m2.\"name\"  as \"Housing\", m3.\"name\" as \"Impeller\",\r\np.description , p.picture , p.price \r\nfrom pumps p left join motors m \r\non p.motor = m.id \r\nleft join materials m2 \r\non p.housingid = m2.id \r\nleft join materials m3 \r\non p.impellerid  = m3.id \r\n");
    }

    public IQueryable<Data<int>> GetPumpById(int id)
    {
        return Pump.FromSqlRaw(string.Format("select p.id as \"Id\", p.\"name\" as \"Name\", p.maxpressure as \"MaxPressure\",\r\np.liquidtemp as \"LiquidTemp\", p.weight as \"Weight\",\r\np.motor as \"Motor\", p.housingid  as \"Housing\", p.\"impellerid\" as \"Impeller\",\r\np.description as \"Description\" , p.picture as \"Picture\", p.price as \"Price\"\r\n from pumps p where id = {0}", id));
    }

    public IQueryable<SelectData> GetMotors()
    {
        return Dict.FromSqlRaw("select id, name from motors m");
    }

    public IQueryable<SelectData> GetMaterials()
    {
        return Dict.FromSqlRaw("select id, name from materials m");
    }

    public int DeletePump(int id)
    {
        return Database.ExecuteSqlRaw(string.Format("delete from pumps where id = {0}", id));
    }

    public int AddPump(Data<int> val)
    {
        string query = $"insert into pumps (\"name\", \"maxpressure\", \"liquidtemp\", \"motor\", \"housingid\", \"impellerid\", \"description\", \"picture\", \"price\", \"weight\") VALUES ('{val.Name}', {val.MaxPressure}, {val.LiquidTemp}, {val.Motor}, {val.Housing}, {val.Impeller}, '{val.Description}', '{val.Picture}', {val.Price}, {val.Weight})";
        return Database.ExecuteSqlRaw(query);
    }
    public int UpdatePump(Data<int> val)
    {
        string query = $"update pumps set \"name\" = '{val.Name}', \"maxpressure\" = {val.MaxPressure}, \"liquidtemp\" = {val.LiquidTemp}, \"motor\" = {val.Motor}, \"housingid\" = {val.Housing}, \"impellerid\" = {val.Impeller}, \"description\" = '{val.Description}', \"picture\" = '{val.Picture}', \"price\" = {val.Price}, \"weight\" = {val.Weight} where id = {val.Id}";
        return Database.ExecuteSqlRaw(query);
    }
}