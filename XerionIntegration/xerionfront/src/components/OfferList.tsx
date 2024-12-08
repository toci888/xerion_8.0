import React from 'react';
import styled from 'styled-components';

const OfferContainer = styled.div\
  padding: 2rem;
\;

const OfferCard = styled.div\
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 1rem;
  margin-bottom: 1rem;
  background-color: white;

  h3 {
    margin: 0 0 0.5rem;
    color: #333;
  }

  p {
    margin: 0;
    color: #666;
  }
\;

const OfferList = () => {
  const offers = [
    { id: 1, title: 'Frontend Developer', company: 'Company A' },
    { id: 2, title: 'Backend Developer', company: 'Company B' },
    { id: 3, title: 'UI/UX Designer', company: 'Company C' },
  ];

  return (
    <OfferContainer>
      {offers.map((offer) => (
        <OfferCard key={offer.id}>
          <h3>{offer.title}</h3>
          <p>{offer.company}</p>
        </OfferCard>
      ))}
    </OfferContainer>
  );
};

export default OfferList;
