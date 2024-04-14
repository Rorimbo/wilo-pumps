using System.Text.RegularExpressions;

// начальные данные
List<Data> pumps = new List<Data>
{
    new() { Id = 0, Name = "NOC 25/8 EM", MaxPressure = 37, LiquidTemp = 10, Weight = 3.20, Motor = "", Housing = "", Impeller = "", Description = "", Picture = "", Price = 123},
    new() { Id = 1, Name = "NOC 26/8 EM", MaxPressure = 37, LiquidTemp = 10, Weight = 3.20, Motor = "", Housing = "", Impeller = "", Description = "", Picture = "", Price = 123},
    new() { Id = 2, Name = "NOC 27/8 EM", MaxPressure = 37, LiquidTemp = 10, Weight = 3.20, Motor = "", Housing = "", Impeller = "", Description = "", Picture = "", Price = 123},
};

var builder = WebApplication.CreateBuilder();
var app = builder.Build();

app.Run(async (context) =>
{
    var response = context.Response;
    var request = context.Request;
    var path = request.Path;
    string expressionForNumber = "^/api/pumps/([0-9]+)$";

    if (path == "/api/pumps" && request.Method == "GET")
    {
        await GetAllData(response);
    }
    else if (Regex.IsMatch(path, expressionForNumber) && request.Method == "GET")
    {
        // получаем id из адреса url
        int? id = int.Parse(path.Value?.Split("/")[3]);
        await GetData(id, response);
    }
    else if (path == "/api/pumps" && request.Method == "POST")
    {
        await CreateData(response, request);
    }
    else if (path == "/api/pumps" && request.Method == "PUT")
    {
        await UpdateData(response, request);
    }
    else if (Regex.IsMatch(path, expressionForNumber) && request.Method == "DELETE")
    {
        int? id = int.Parse(path.Value?.Split("/")[3]);
        await DeleteData(id, response);
    }
    else
    {
        await SendError(response);
    }
});

app.Run();


async Task SendError(HttpResponse response)
{
    response.StatusCode = 404;
    await response.WriteAsJsonAsync(new { message = "Запрос не найден" });
}

// получение всех элементов
async Task GetAllData(HttpResponse response)
{
    await response.WriteAsJsonAsync(pumps);
}
// получение одного элемента по id
async Task GetData(int? id, HttpResponse response)
{
    // получаем элемент по id
    Data? pump = pumps.FirstOrDefault((u) => u.Id == id);
    // если элемент найден, отправляем его
    if (pump != null)
        await response.WriteAsJsonAsync(pump);
    // если не найден, отправляем статусный код и сообщение об ошибке
    else
    {
        response.StatusCode = 404;
        await response.WriteAsJsonAsync(new { message = "Элемент не найден" });
    }
}

async Task DeleteData(int? id, HttpResponse response)
{
    // получаем элемент по id
    Data? pump = pumps.FirstOrDefault((u) => u.Id == id);
    // если элемент найден, удаляем его
    if (pump != null)
    {
        pumps.Remove(pump);
        await response.WriteAsJsonAsync(pump);
    }
    // если не найден, отправляем статусный код и сообщение об ошибке
    else
    {
        response.StatusCode = 404;
        await response.WriteAsJsonAsync(new { message = "Элемент не найден" });
    }
}

async Task CreateData(HttpResponse response, HttpRequest request)
{
    try
    {
        // получаем данные элемента
        var pump = await request.ReadFromJsonAsync<Data>();
        if (pump != null)
        {
            // устанавливаем id для нового элемента
            pump.Id = pumps.Count;
            // добавляем элемент в список
            pumps.Add(pump);
            await response.WriteAsJsonAsync(pump);
        }
        else
        {
            throw new Exception("Некорректные данные");
        }
    }
    catch (Exception)
    {
        response.StatusCode = 400;
        await response.WriteAsJsonAsync(new { message = "Некорректные данные" });
    }
}

async Task UpdateData(HttpResponse response, HttpRequest request)
{
    try
    {
        // получаем данные элемента
        Data? pumpData = await request.ReadFromJsonAsync<Data>();
        if (pumpData != null)
        {
            // получаем элемент по id
            var pump = pumps.FirstOrDefault(u => u.Id == pumpData.Id);
            // если элемент найден, изменяем его данные и отправляем обратно клиенту
            if (pump != null)
            {
                await response.WriteAsJsonAsync(pumpData);
            }
            else
            {
                response.StatusCode = 404;
                await response.WriteAsJsonAsync(new { message = "Элемент не найден" });
            }
        }
        else
        {
            throw new Exception("Некорректные данные");
        }
    }
    catch (Exception)
    {
        response.StatusCode = 400;
        await response.WriteAsJsonAsync(new { message = "Некорректные данные" });
    }
}
public class Data
{
    public int Id { get; set; }
    public string Name { get; set; } = "";
    public int MaxPressure { get; set; }
    public int LiquidTemp { get; set; }
    public double Weight { get; set; }
    public string Motor { get; set; } = "";
    public string Housing { get; set; } = "";
    public string Impeller { get; set; } = "";
    public string Description { get; set; } = "";
    public string Picture { get; set; } = "";
    public int Price { get; set; }
}