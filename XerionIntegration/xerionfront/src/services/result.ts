import axios from 'axios';

const baseUrl = 'https://api.example.com';

export const result = async (): Promise<any> => {
    const response = await axios.get(\\/endpoint\);
    return response.data;
};

export default result;