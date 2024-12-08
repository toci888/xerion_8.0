import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'https://your-api-url.com',
  headers: {
    'Content-Type': 'application/json',
  },
});

export const getAllUsers = async () => {
  const response = await apiClient.get('/api/users');
  return response.data;
};

export const getUsersById = async (id: number) => {
  const response = await apiClient.get($endpoint/\);
  return response.data;
};

export const createUsers = async (data: any) => {
  const response = await apiClient.post('/api/users', data);
  return response.data;
};

export const updateUsers = async (id: number, data: any) => {
  const response = await apiClient.put($endpoint/\, data);
  return response.data;
};

export const deleteUsers = async (id: number) => {
  const response = await apiClient.delete($endpoint/\);
  return response.data;
};
