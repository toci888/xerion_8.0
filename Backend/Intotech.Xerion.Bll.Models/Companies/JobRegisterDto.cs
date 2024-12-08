using Intotech.Common.Bll.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Intotech.Xerion.Bll.Models.ModelDtos.Companies.Dtos;

namespace Intotech.Xerion.Bll.Models.Companies
{
    public class JobRegisterDto : ModelBase
    {
        public JobadvertisementModelDto Job { get; set; }
        public List<JobRegisterDetailsModelDto> JobDetails { get; set; }
        public List<JobRegisterTechnologiesModelDto> JobTechnologies { get; set; }
    }
}
