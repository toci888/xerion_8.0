import axios from 'axios';

const job-offer-applies = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default job-offer-applies;
