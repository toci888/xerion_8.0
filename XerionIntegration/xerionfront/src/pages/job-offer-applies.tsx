import React, { useEffect, useState } from 'react';

const job-offer-applies = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('job-offer-applies mounted');
    }, []);

    return (
        <div>
            <h1>job-offer-applies Component</h1>
        </div>
    );
};

export default job-offer-applies;
