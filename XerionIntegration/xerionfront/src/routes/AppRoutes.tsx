import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Example from '../pages/Example';

const AppRoutes: React.FC = () => {
    return (
        <Router>
            <Routes>
                <Route path='/example' element={<Example />} />
            </Routes>
        </Router>
    );
};

export default AppRoutes;
