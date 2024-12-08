import React, { useEffect, useState } from 'react';

const quizzes = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('quizzes mounted');
    }, []);

    return (
        <div>
            <h1>quizzes Component</h1>
        </div>
    );
};

export default quizzes;
