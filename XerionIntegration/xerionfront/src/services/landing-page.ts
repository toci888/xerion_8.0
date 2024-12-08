import axios from 'axios';

const baseUrl = 'https://api.example.com';

export const landing-page = async (): Promise<any> => {
    const response = await axios.get(\\/endpoint\);
    return response.data;
};

export default landing-page;
