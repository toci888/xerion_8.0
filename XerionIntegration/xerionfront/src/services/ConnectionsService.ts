import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'https://your-api-url.com',
  headers: {
    'Content-Type': 'application/json',
  },
});

export const getAllConnections = async () => {
  const response = await apiClient.get('/api/connections');
  return response.data;
};

export const getConnectionsById = async (id: number) => {
  const response = await apiClient.get($endpoint/\);
  return response.data;
};

export const createConnections = async (data: any) => {
  const response = await apiClient.post('/api/connections', data);
  return response.data;
};

export const updateConnections = async (id: number, data: any) => {
  const response = await apiClient.put($endpoint/\, data);
  return response.data;
};

export const deleteConnections = async (id: number) => {
  const response = await apiClient.delete($endpoint/\);
  return response.data;
};
