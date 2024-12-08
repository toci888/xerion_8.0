import React from 'react';
import styled from 'styled-components';

const SearchContainer = styled.div\
  display: flex;
  justify-content: center;
  padding: 2rem;
  background-color: #f0f0f0;
\;

const Input = styled.input\
  padding: 0.5rem;
  margin-right: 1rem;
  width: 300px;
  border: 1px solid #ccc;
  border-radius: 4px;
\;

const Button = styled.button\
  padding: 0.5rem 1rem;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  &:hover {
    background-color: #45a049;
  }
\;

const SearchSection = () => {
  return (
    <SearchContainer>
      <Input type="text" placeholder="Search for jobs..." />
      <Button>Search</Button>
    </SearchContainer>
  );
};

export default SearchSection;
