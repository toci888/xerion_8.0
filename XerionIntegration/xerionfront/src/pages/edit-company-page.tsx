import React, { useEffect, useState } from 'react';

const edit-company-page = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('edit-company-page mounted');
    }, []);

    return (
        <div>
            <h1>edit-company-page Component</h1>
        </div>
    );
};

export default edit-company-page;
