import React, { useEffect, useState } from 'react';

const navigationmenu = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('navigation-menu mounted');
    }, []);

    return (
        <div>
            <h1>navigation-menu Component</h1>
        </div>
    );
};

export default navigationmenu;
