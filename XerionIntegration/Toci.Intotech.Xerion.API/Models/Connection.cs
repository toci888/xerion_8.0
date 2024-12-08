public class Connection
{
    public int Id { get; set; }
    public int UserId { get; set; }
    public int ConnectedUserId { get; set; }
    public User User { get; set; }
    public User ConnectedUser { get; set; }
}
