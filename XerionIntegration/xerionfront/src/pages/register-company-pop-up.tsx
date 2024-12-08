import React, { useEffect, useState } from 'react';

const register-company-pop-up = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('register-company-pop-up mounted');
    }, []);

    return (
        <div>
            <h1>register-company-pop-up Component</h1>
        </div>
    );
};

export default register-company-pop-up;
