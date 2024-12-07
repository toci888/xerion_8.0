namespace Toci.Intotech.Xerion.API.Models
{
    public class User
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Region { get; set; }

        // Relationships
        public ICollection<Company> Companies { get; set; } = new List<Company>();
        public ICollection<Property> Properties { get; set; } = new List<Property>();
    }
}
