import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'https://your-api-url.com',
  headers: {
    'Content-Type': 'application/json',
  },
});

export const getAllCompanies = async () => {
  const response = await apiClient.get('/api/companies');
  return response.data;
};

export const getCompaniesById = async (id: number) => {
  const response = await apiClient.get($endpoint/\);
  return response.data;
};

export const createCompanies = async (data: any) => {
  const response = await apiClient.post('/api/companies', data);
  return response.data;
};

export const updateCompanies = async (id: number, data: any) => {
  const response = await apiClient.put($endpoint/\, data);
  return response.data;
};

export const deleteCompanies = async (id: number) => {
  const response = await apiClient.delete($endpoint/\);
  return response.data;
};
