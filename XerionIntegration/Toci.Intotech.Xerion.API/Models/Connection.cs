namespace Toci.Intotech.Xerion.API.Models
{
    public class Connection
    {
        public int Id { get; set; }
        public int JobSeeker1Id { get; set; }
        public int JobSeeker2Id { get; set; }
        public bool Approved { get; set; }
    }
}
