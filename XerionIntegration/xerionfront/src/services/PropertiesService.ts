import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'https://your-api-url.com',
  headers: {
    'Content-Type': 'application/json',
  },
});

export const getAllProperties = async () => {
  const response = await apiClient.get('/api/properties');
  return response.data;
};

export const getPropertiesById = async (id: number) => {
  const response = await apiClient.get($endpoint/\);
  return response.data;
};

export const createProperties = async (data: any) => {
  const response = await apiClient.post('/api/properties', data);
  return response.data;
};

export const updateProperties = async (id: number, data: any) => {
  const response = await apiClient.put($endpoint/\, data);
  return response.data;
};

export const deleteProperties = async (id: number) => {
  const response = await apiClient.delete($endpoint/\);
  return response.data;
};
