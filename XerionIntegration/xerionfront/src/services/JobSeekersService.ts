import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'https://your-api-url.com',
  headers: {
    'Content-Type': 'application/json',
  },
});

export const getAllJobSeekers = async () => {
  const response = await apiClient.get('/api/jobseekers');
  return response.data;
};

export const getJobSeekersById = async (id: number) => {
  const response = await apiClient.get($endpoint/\);
  return response.data;
};

export const createJobSeekers = async (data: any) => {
  const response = await apiClient.post('/api/jobseekers', data);
  return response.data;
};

export const updateJobSeekers = async (id: number, data: any) => {
  const response = await apiClient.put($endpoint/\, data);
  return response.data;
};

export const deleteJobSeekers = async (id: number) => {
  const response = await apiClient.delete($endpoint/\);
  return response.data;
};
