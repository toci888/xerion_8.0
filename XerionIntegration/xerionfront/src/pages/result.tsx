import React, { useEffect, useState } from 'react';

const result = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('result mounted');
    }, []);

    return (
        <div>
            <h1>result Component</h1>
        </div>
    );
};

export default result;
