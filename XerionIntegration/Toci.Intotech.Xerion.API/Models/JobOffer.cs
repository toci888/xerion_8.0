namespace Toci.Intotech.Xerion.API.Models
{
    public class JobOffer
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal Salary { get; set; }
        public DateTime PostedDate { get; set; }
    }
}
