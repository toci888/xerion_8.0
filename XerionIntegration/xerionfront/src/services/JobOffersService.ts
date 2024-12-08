import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'https://your-api-url.com',
  headers: {
    'Content-Type': 'application/json',
  },
});

export const getAllJobOffers = async () => {
  const response = await apiClient.get('/api/joboffers');
  return response.data;
};

export const getJobOffersById = async (id: number) => {
  const response = await apiClient.get($endpoint/\);
  return response.data;
};

export const createJobOffers = async (data: any) => {
  const response = await apiClient.post('/api/joboffers', data);
  return response.data;
};

export const updateJobOffers = async (id: number, data: any) => {
  const response = await apiClient.put($endpoint/\, data);
  return response.data;
};

export const deleteJobOffers = async (id: number) => {
  const response = await apiClient.delete($endpoint/\);
  return response.data;
};
