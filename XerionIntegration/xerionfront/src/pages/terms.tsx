import React, { useEffect, useState } from 'react';

const terms = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('terms mounted');
    }, []);

    return (
        <div>
            <h1>terms Component</h1>
        </div>
    );
};

export default terms;
