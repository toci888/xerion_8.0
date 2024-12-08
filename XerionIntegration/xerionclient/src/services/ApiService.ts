import axios from 'axios';

const ApiService = axios.create({
  baseURL: 'https://api.example.com',
  timeout: 10000,
});

export default ApiService;
