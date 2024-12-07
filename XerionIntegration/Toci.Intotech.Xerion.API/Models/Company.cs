namespace Toci.Intotech.Xerion.API.Models
{
    public class Company
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Industry { get; set; }
        public string Region { get; set; }

        // Relationships
        public int OwnerId { get; set; }
        public User Owner { get; set; }
    }
}
