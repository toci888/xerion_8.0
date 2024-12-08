import React, { useState } from 'react';

const JobOffers: React.FC = () => {
  const [searchTerm, setSearchTerm] = useState<string>('');
  const [locationTerm, setLocationTerm] = useState<string>('');
  const [jobs, setJobs] = useState<any[]>([]);

  const searchJobs = () => {
    console.log('Search triggered with:', searchTerm, locationTerm);
    // Dodaj logikę wyszukiwania tutaj
  };

  const getTechName = (icon: string): string => {
    // Przykładowa logika pobierania nazwy technologii
    return icon;
  };

  return (
    <div>
      {/* Sekcja główna */}
      <div className="custom-section">
        <div className="background-image"></div>
        <div className="content">
          <h1>{'HomePage.Find job'}</h1>
          <div className="inputs">
            <input
              type="text"
              placeholder="Junior Java Developer..."
              className="finddev"
              value={searchTerm}
              onChange={(e) => {
                setSearchTerm(e.target.value);
                searchJobs();
              }}
            />
            <input
              type="text"
              placeholder="Poznań"
              className="locatedev"
              value={locationTerm}
              onChange={(e) => {
                setLocationTerm(e.target.value);
                searchJobs();
              }}
            />
          </div>
        </div>
      </div>

      {/* Sekcja informacji */}
      <div className="info-section">
        <div className="title">
          <h1>{'HomePage.Jobs'}</h1>
        </div>
        <div className="subtitle">
          <h2>{'HomePage.Find offers'}</h2>
        </div>
      </div>

      {/* Oferty pracy */}
      <div className="jobOffers" id="ofert">
        {jobs.map((job) => (
          <div className="offer" key={job.job.id}>
            <div className="left">
              <a href={`/joboffer/${job.job.id}`} className="logocompany">
                <img
                  className="avatar"
                  alt="avatar"
                  src={job.company.logo || '../../../assets/images/logoEmpty.png'}
                />
              </a>
              <div className="companyName">
                <a href={`/joboffer/${job.job.id}`} className="jobname">
                  <span>{job.job.name}</span>
                </a>
                <a href={`/company/${job.company.id}`} className="companyname">
                  <span>{job.company.name}</span>
                </a>
              </div>
            </div>
            <div className="center">
              <div className="tags">
                {job.jobTechnologies.slice(0, 4).map((technology, index) => (
                  <div className="tag" key={index}>
                    {technology.icon && getTechName(technology.icon)}
                  </div>
                ))}
              </div>
            </div>
            <div className="right">
              <p>{job.job.image || job.company.headquarteraddress}</p>
              <button
                className="applyButton"
                onClick={() => (window.location.href = `/joboffer/${job.job.id}`)}
              >
                <span>{'HomePage.See offer'}</span>
              </button>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default JobOffers;
