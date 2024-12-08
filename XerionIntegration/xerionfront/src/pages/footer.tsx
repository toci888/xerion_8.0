import React, { useEffect, useState } from 'react';

const footer = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('footer mounted');
    }, []);

    return (
        <div>
            <h1>footer Component</h1>
        </div>
    );
};

export default footer;
