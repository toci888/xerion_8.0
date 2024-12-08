import React, { useEffect, useState } from 'react';

const joboffer = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('joboffer mounted');
    }, []);

    return (
        <div>
            <h1>joboffer Component</h1>
        </div>
    );
};

export default joboffer;
