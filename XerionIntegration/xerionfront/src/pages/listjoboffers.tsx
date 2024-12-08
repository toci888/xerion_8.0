import React, { useEffect, useState } from 'react';

const listjoboffers = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('listjoboffers mounted');
    }, []);

    return (
        <div>
            <h1>listjoboffers Component</h1>
        </div>
    );
};

export default listjoboffers;
