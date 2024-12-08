import React, { useEffect, useState } from 'react';

const timer = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('timer mounted');
    }, []);

    return (
        <div>
            <h1>timer Component</h1>
        </div>
    );
};

export default timer;
