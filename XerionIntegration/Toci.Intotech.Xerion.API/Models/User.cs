public class User
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Profession { get; set; }
    public string Location { get; set; }
    public List<Connection> Connections { get; set; }
    public string FullName { get; internal set; }
    public string Email { get; internal set; }
    public string PhoneNumber { get; internal set; }
    public string Region { get; internal set; }
}
