import React, { useEffect, useState } from 'react';

const edit-joboffer = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('edit-joboffer mounted');
    }, []);

    return (
        <div>
            <h1>edit-joboffer Component</h1>
        </div>
    );
};

export default edit-joboffer;
