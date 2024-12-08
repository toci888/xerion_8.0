import React from 'react';
import Header from '../components/Header';
import SearchSection from '../components/SearchSection';
import OfferList from '../components/OfferList';
import Footer from '../components/Footer';

const HomePage = () => {
  return (
    <div>
      <Header />
      <SearchSection />
      <OfferList />
      <Footer />
    </div>
  );
};

export default HomePage;
