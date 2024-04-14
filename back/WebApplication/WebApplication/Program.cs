using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder();
builder.Services.AddCors();

builder.Services.AddDbContext<ApplicationContext>(options =>
    options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection")));

var app = builder.Build();
app.UseCors(builder => builder.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod());

app.UseDefaultFiles();
app.UseStaticFiles();

app.MapGet("/api/pumps/getAll", async (ApplicationContext db) => await db.GetPumps().ToListAsync());
app.MapGet("/api/pumps/getMotors", async (ApplicationContext db) => await db.GetMotors().ToListAsync());
app.MapGet("/api/pumps/getMaterials", async (ApplicationContext db) => await db.GetMaterials().ToListAsync());

app.MapGet("/api/pumps/get/{id:int}", async (int id, ApplicationContext db) =>
{
    Data<int>? pump = await db.GetPumpById(id).FirstAsync();

    if (pump == null) return Results.NotFound(new { message = "Данные не найдены" });

    return Results.Json(pump);
});

app.MapDelete("/api/pumps/delete/{id:int}", async (int id, ApplicationContext db) =>
{
    Data<int>? pump = await db.GetPumpById(id).FirstAsync();

    if (pump == null) { return Results.NotFound(new { message = "Данные не найдены" }); }

    db.DeletePump(id);
    return Results.Json(pump);
});

app.MapPost("/api/pumps/add", async (Data<int> pump, ApplicationContext db) =>
{
    db.AddPump(pump);
    return Results.Json(pump);
});

app.MapPut("/api/pumps/update", async (Data<int> pumpData, ApplicationContext db) =>
{
    Data<int>? pump = await db.GetPumpById(pumpData.Id).FirstAsync();

    if (pump == null) return Results.NotFound(new { message = "Данные не найдены" });

    pump = pumpData;
    db.UpdatePump(pump);
    return Results.Json(pump);
});

app.Run();